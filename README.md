# MD to PDF for CW Specs Action

Converts markdown documents to PDFs for Moodle uploads

### Example

```
on: [push]

jobs:
  example:
    runs-on: ubuntu-latest
    name: Example
    steps:
    - 
      name: Example Step
      id: example
      uses: willfantom/convert-spec-action@main
      with:
        spec-directory: moodle
    - 
      name: Print numbder converted
      run: echo "Converted ${{ steps.example.outputs.count }} MD files to PDF"
```