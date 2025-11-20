# Contribuir

Para contribuir, simplemente navega hasta el directorio donde hayas clonado el repositorio (`{data-dir}/typst/packages/report-template-typst/0.1.0/`) y emplea el directorio `example/` como _sandbox_ para probar tus modificaciones sobre `lib.typst` u otros documentos.

## Estructura
El repositorio cuenta con la siguente estructura:

```bash
└── report-template-typst/
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

