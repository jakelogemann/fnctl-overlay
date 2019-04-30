{ pkgs, lib, ... }:

with lib;
with builtins;

let
  leader      = "<Space>";
  localLeader = ",";

  lMap        = "g:which_key_leader_map";
  llMap       = "g:which_key_localleader_map";

  globalMaps  = with builtins; fromJSON (readFile ./keybinds.json);

  mapPath = varName: pathList: let
    join = x: (lib.concatStringsSep "" x);
    subPath = (map (s: "['${s}']") pathList);
  in (join ([varName] ++ subPath));

  mkMap = rec {
    VimMap = {
      action ? "<Nop>",
      key ? "<Plug>(temp-scratch-map)",
      type ? "",
      seperator ? " ",
      silent ? true,
      silentStr ? "<silent>",
      bufferStr ? "<buffer>",
      buffer ? false,
    }: concatStringsSep seperator ([
      "${type}noremap"
      (if silent then silentStr else "")
      (if buffer then bufferStr else "")
      "${key}"
      "${action}"
    ]);

    GuideMap  = {
      prefix    ? "${lMap}",
      action    ? "",
      name      ? action,
      keys      ? [],
    }: if (lib.stringLength action) < 1
    then "let ${mapPath prefix keys} = { 'name': '${name}' }"
    else "let ${mapPath prefix keys} = ['${action}', '${name}']";

    GuideLeaderMap = { action ? "", name ? action, keys ? [] }: GuideMap {
      inherit action name keys;
      prefix = "${lMap}";
    };

    GuideLocalMap = { action ? "", name ? action, keys ? [] }: GuideMap {
      inherit action name keys;
      prefix = "${llMap}";
    };

    # List Operations
    JoinMapList   = mapList:  lib.concatStringsSep "\n" mapList;
      VimMapList    = { type, mapList }:  (map (o: VimMap { inherit (o) action key; inherit type;}) mapList);
      guideNMap     = { bind ? key, key ? bind }: "nnoremap <silent>  ${bind}  :<c-u>WhichKey  '${key}'<cr>";
      guideVMap     = { bind ? key, key ? bind }: "vnoremap <silent>  ${bind}  :<c-u>WhichKeyVisual  '${key}'<cr>";
    };

  mapLists  = {
    normal   = mkMap.VimMapList { type = "n"; mapList = globalMaps.normal; };
    insert   = mkMap.VimMapList { type = "i"; mapList = globalMaps.insert; };
    command  = mkMap.VimMapList { type = "c"; mapList = globalMaps.command; };
    visual   = mkMap.VimMapList { type = "v"; mapList = globalMaps.visual; };
    terminal = mkMap.VimMapList { type = "t"; mapList = globalMaps.terminal; };
    leader   = (map (o: mkMap.GuideLeaderMap {
      inherit (o) action keys;
      name = if lib.stringLength o.name > 0 then o.name else o.action;
    }) globalMaps.leader);
  };

in with vimConfig; ''
    function! AddMyNixKeybinds()
      ${mkMap.JoinMapList ([]
      ++ mapLists.normal
      ++ mapLists.insert
      ++ mapLists.command
      ++ mapLists.visual
      ++ mapLists.terminal
      )}

    endfunction

    if v:vim_did_enter
      call AddMyNixKeybinds()
    else
      au VimEnter * call AddMyNixKeybinds()
    endif

    command! -nargs=0 AddMyNixKeybinds :call AddMyNixKeybinds()
    command! -nargs=0 ReloadKeybinds   :call AddMyNixKeybinds()

  " In normal mode, press Space to toggle the current fold open/closed. However, if
  " the cursor is not in a fold, move to the right (the default behavior). In
  " addition, with the manual fold method, you can create a fold by visually
  " selecting some lines, then pressing Space.
  nnoremap <silent> <Tab> @=(foldlevel('.')?'za':"\<Space>")<CR>
  vnoremap <Tab> zf

  " F9 Toggles Folds
  " you can toggle folds open/closed by pressing F9. In addition, if you have
  " :set foldmethod=manual, you can visually select some lines, then press F9
  " to create a fold.
  inoremap <F9> <C-O>za
  nnoremap <F9> za
  onoremap <F9> <C-C>za
  vnoremap <F9> zf
''

