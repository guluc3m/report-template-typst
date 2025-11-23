# Plantilla de Typst para memorias de la UC3M

## Uso

Navega hasta el directorio `{data-dir}/typst/packages/local/` y clona el repositorio:

> [!NOTE]
> El directorio `{data-dir}` es diferente en cada sistema operativo:
>
> - `~/.local/share/` en linux
> - `~/Library/Application Support/` en MacOS
> - `%APPDATA%` (`C:\Users\UsuarioEjemplo\AppData\Roaming`) en Windows
>
> Para más información, consultar la [documentación](https://github.com/typst/packages?tab=readme-ov-file#local-packages)

```bash
git clone https://github.com/guluc3m/report-template-typst.git report-template-typst/0.1.0/
```

Una vez completado esto, navega hasta el directorio donde desees guardar tu report y ejecuta:

```bash
typst init @local/report-template-typst
cd report-template-typst
```

Para compilar, instala [Typst](https://github.com/typst/typst?tab=readme-ov-file#installation) y corre:

```bash
typst compile report.typ
```

> [!TIP]
> Para usuarios de [VS Code](https://code.visualstudio.com/), se recomienda usar la extensión [Tinymist Typst](https://marketplace.visualstudio.com/items/?itemName=myriad-dreamin.tinymist), la cual no requiere instalar el compilador.

> [!TIP]
> Para usuarios de [Neovim](https://neovim.io/), se recomienda usar el plugin [typst-preview.nvim](https://github.com/chomosuke/typst-preview.nvim).

## Más información

- [Documentación de Typst](https://typst.app/docs)
- [_Cheatsheet_ de Typst](https://typst.app/docs/reference/syntax/)
- [Guía para usuarios de LaTeX](https://typst.app/docs/guides/guide-for-latex-users/)
  - [Conversor de fórmulas de LaTeX a Typst](https://qwinsi.github.io/tex2typst-webapp)
- [Chuleta para fórmulas](https://qwinsi.github.io/tex2typst-webapp/cheat-sheet.html)
- [Generador de tablas](https://www.latex-tables.com/?format=typst&force)
- [Typst Examples Book](https://sitandr.github.io/typst-examples-book/book/)
