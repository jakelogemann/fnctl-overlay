{ fetchgit, vimUtils, ... }:

vimUtils.buildVimPlugin {
  name = "ncm2-vim";
  dependencies = [];
  dontBuild = true;
  src = fetchgit {
    url = "https://github.com/ncm2/ncm2-vim.git";
    rev = "df7fa062debc9d2f318e7d4a1de50c5795773f6f";
    sha256 = "0lx27hmpgkj8s3mrh5agz5mfhlznbvhi12aiv71in5zva899gmps";
    fetchSubmodules = false;
  };
}
