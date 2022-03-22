{
  description = ''Static GLFW 3 wrapper for Nim'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-staticglfw-4_0_1.flake = false;
  inputs.src-staticglfw-4_0_1.ref   = "refs/tags/4.0.1";
  inputs.src-staticglfw-4_0_1.owner = "treeform";
  inputs.src-staticglfw-4_0_1.repo  = "staticglfw";
  inputs.src-staticglfw-4_0_1.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-staticglfw-4_0_1"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-staticglfw-4_0_1";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}