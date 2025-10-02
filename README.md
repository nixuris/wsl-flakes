### Personal flakes for WSL setup.

### How to install!

Clone the repo:

```
git clone https://github.com/nixuris/wsl-flakes.git
```

Build home manager:

```
nix run home-manager -- switch --flake .#<username>@<hostname>
```

---
