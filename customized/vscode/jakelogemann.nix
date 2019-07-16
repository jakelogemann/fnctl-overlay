{ buildEnv, vscode-with-extensions, vscode-extensions, vscode-utils }:

buildEnv {
  name = "vscode-jakelogemann";
  paths = [
    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [
        bbenoist.Nix
        ms-vscode.cpptools
        ms-python
      ] ++ vscode-utils.extensionsFromVscodeMarketplace [
          { name = "Bookmarks";                 version = "10.4.3";  sha256 = "1y6y17zcfx56dqnki7yz4awl5b0xwajrlfg2jbwcpwpsi0njz46q";              publisher = "alefragnani";          }
          { name = "EditorConfig";              version = "0.13.0";  sha256 = "1dy7rf9w1mvk65fmxbvhbi5pf6cw2lwi07yhafq9x20c36g6dwyz";              publisher = "EditorConfig";         }
          { name = "Go";                        version = "0.9.2";   sha256 = "1f73c624fc08fee94c2e4c68289cbcd584d13b8930638bbadd2dfc8ffcd2b67b";  publisher = "ms-vscode";            }
          { name = "Lua";                       version = "0.0.9";   sha256 = "2001bda605de12ba56990da03ebe9011a75b72f704f798886fe5b787f119fbed";  publisher = "keyring";              }
          { name = "Ruby";                      version = "0.22.3";  sha256 = "4f0562f5ce9a41907c02bb373ec3e416214af3fb080c980476f1c4a6adf990ca";  publisher = "rebornix";             }
          { name = "better-comments";           version = "2.0.3";   sha256 = "65760067d935787109c7722388dc4e291348d9660a734543e6c30300e90ad2ec";  publisher = "aaron-bond";           }
          { name = "better-toml";               version = "0.3.2";   sha256 = "08lhzhrn6p0xwi0hcyp6lj9bvpfj87vr99klzsiy8ji7621dzql3";              publisher = "bungcip";              }
          { name = "bracket-pair-colorizer";    version = "1.0.16";  sha256 = "16g5yf9bwmq9kdixhcqpyxhp4pvavdbc0klv7kq1q7n7apql9s2g";              publisher = "CoenraadS";            }
          { name = "horizon-theme-vscode";      version = "1.8.0";   sha256 = "b4d064cdd7c0d254fd2706d24958f3ec6a2727f35406fa38a9e7841cf16249ee";  publisher = "jolaleye";             }
          { name = "language-haskell";          version = "2.5.0";   sha256 = "639987da2d55d524bc7e7e307e19593c2fd687ca4bc28f6852cdf4c231925882";  publisher = "justusadam";           }
          { name = "ocaml";                     version = "0.6.43";  sha256 = "214364c22ee52aa83e0970876f25da543bcd41446127e85bf22730bab421fef8";  publisher = "hackwaly";             }
          { name = "output-colorizer";          version = "0.1.2";   sha256 = "676da74bd756d70ecbf6d68edcf931cd003db4eaac3e340f635ed931a9bd3345";  publisher = "IBM";                  }
          { name = "path-intellisense";         version = "1.4.2";   sha256 = "0i2b896cnlk1d23w3jgy8wdqsww2lz201iym5c1rqbjzg1g3v3r4";              publisher = "christian-kohler";     }
          { name = "project-manager";           version = "10.5.1";  sha256 = "1k8l5pyacpld9r76fqynpdx0zkzylvb5lickvxlnql2zb70cxk05";              publisher = "alefragnani";          }
          # { name = "rust";                      version = "0.6.1";   sha256 = "0f66z6b374nvnrn7802dg0xz9f8wq6sjw3sb9ca533gn5jd7n297";              publisher = "rust-lang";            }
          { name = "vscode-theme-1984";         version = "0.0.30";  sha256 = "15avmd6jm1mxp7bxpd0rkk4r4wh7abqg653z10m0f9p6sda0r7h4";              publisher = "juanmnl";              }
          { name = "vscode-rust";               version = "0.4.2";   sha256 = "03hjx2xcilikp8cfswr7jljm683c1w5gcngjadxlsvcmybsgzhh2";              publisher = "kalitaalexey";         }
          { name = "terraform";                 version = "1.3.9";   sha256 = "82784f4f8e23acf08b1dcaab14fff9fcd73635b83af4e203d97bc71c44ceca42";  publisher = "mauve";                }
          { name = "theme-dracula";             version = "2.18.0";  sha256 = "02e91379ff0770c2a15e7447703fb6cf235d64caf9f0809b2598e477430a90ac";  publisher = "dracula-theme";        }
          { name = "theme-monokai-pro-vscode";  version = "1.1.12";  sha256 = "a5e1b742053d63d59c6a9b38f51705a3083d72497ed4fc00eac849332faadab1";  publisher = "monokai";              }
          { name = "todo-tree";                 version = "0.0.132"; sha256 = "0hn0an4a8hyqxksly8y62rjhx2h9src4zkkjmmima6mjxlgb344x";              publisher = "Gruntfuggly";          }
          { name = "vim";                       version = "1.2.0";   sha256 = "976d4d8f8b415db72c6275ae9c0e3cc7e7d71252098355bf947db0aff2d8f630";  publisher = "vscodevim";            }
          # { name = "vscode-ansible";            version = "0.5.2";   sha256 = "9d5f2b8d919cdae98733295cd9c95cd63b81ccd33dcdb0902465249398c32a64";  publisher = "vscoss";               }
          { name = "vscode-power-mode";         version = "2.2.0";   sha256 = "0v1vqkcsnwwbb7xbpq7dqwg1qww5vqq7rc38qfk3p6b4xhaf8scm";              publisher = "hoovercj";             }
          { name = "vscode-yaml";               version = "0.4.0";   sha256 = "c1a57721025eb62d0a010fbe822f222828992fff8a37dff8d25da047fe17ab82";  publisher = "redhat";               }
          # { sha256 = "bfadcb068e5cd517e3947ee1fca0b809fdb178bf0cd693f6546b252f274798ab";  publisher = "ms-kubernetes-tools";  name = "vscode-kubernetes-tools";   version = "0.1.18"; }
        ];

      })
    ];
  }
