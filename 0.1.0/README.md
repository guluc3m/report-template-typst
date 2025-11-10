# Plantilla de Typst para memorias de la UC3M

## Estructura
El repositorio cuenta con la siguente estructura:

```bash
└── 0.1.0
    ├── doc
    │   ├── documentation.pdf
    │   ├── documentation.typ
    │   └── img
    │       ├── cover_few_authors.png
    │       └── cover_many_authors.png
    ├── example
    │   ├── apendixes.typ
    │   ├── bib.bib
    │   ├── img
    │   ├── report.pdf
    │   └── report.typ
    ├── img
    │   ├── new_uc3m_logo.svg
    │   └── old_uc3m_logo.svg
    ├── lib.typ
    ├── README.md
    ├── template
    │   ├── apendixes.typ
    │   ├── bib.bib
    │   ├── img
    │   ├── report.pdf
    │   └── report.typ
    └── typst.toml
```

El archivo de configuración, [`lib.typ`](/lib.typ), contiene la configuración de la plantilla y el archivo [`template/report.typ`](/template/report.typ) es la plantilla editable por el usuario.

Cuando se ejecuta `typst init @local/report-template-typst` se crea un directorio con el nombre `report-template-typst` que contiene solo el contenido de `template/` (como se especifica en [`typst.toml`](/typst.toml)).

Para más información, consulta la [documentación](/doc/documentation.pdf) de la plantilla.

## Uso

Navega hasta el directorio `{data-dir}/typst/packages/` y clona el repositorio:

> [!NOTE]
> El directorio `{data-dir}` es diferente en cada sistema operativo:
> - `~/.local/share/` en linux
> - `~/Library/Application Support/` en MacOS
> - `%APPDATA%` (`C:\Users\UsuarioEjemplo\AppData\Roaming`) en Windows
> 
> Para más información, consultar la [documentación](https://github.com/typst/packages?tab=readme-ov-file#local-packages)

```bash
git clone git@github.com:guluc3m/report-template-typst.git
```

Una vez completado esto, navega hasta el directorio donde desees guardar tu report y ejecuta:

```bash
typst init @local/report-template-typst.git
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
