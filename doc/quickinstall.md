# Quick install

The template is divide into to files: a main file, [`report.typ`](/report.typ), and a template file [`uc3mreport.typ`](/uc3mreport.typ), with all the configuration.

To use it as simple as running the cloning the repository the directory you desire to store your project and `cd` into it:

```bash
$ git clone git@github.com:guluc3m/report-template-typst.git ~/path/to/directory
$ cd ~/path/to/directory
```
With [Typst](https://typst.app/) installed, execute the following command to compile your document.

```bash
$ typst compile report.typ
```
Alternatively, if you want your document to render every time it changes execute:

```bash
$ typst watch report.typ
```

> [!TIP]
> For [VS Code](https://code.visualstudio.com/) users, the recomended extension is [Tinymist Typst](https://marketplace.visualstudio.com/items/?itemName=myriad-dreamin.tinymist), which doesn't require you to install the compiler.

> [!TIP]
> For [Neovim](https://neovim.io/) users, the recomended extension is [typst-preview.nvim](https://github.com/chomosuke/typst-preview.nvim).

Congratulations, you are now closer to finishing that beautiful report!
