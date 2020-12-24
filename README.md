# MD to PDF for CW Specs Action

Converts markdown documents to PDFs for Moodle uploads

### Example

```
on: [push]

jobs:
  example:
    runs-on: ubuntu-latest
    if: "contains(github.event.head_commit.message, 'moodle')"
    name: Example
    steps:
    - 
      uses: actions/checkout@v2
    - 
      name: Example Step
      id: example
      uses: willfantom/convert-spec-action@main
      with:
        spec-directory: moodle
    - 
      name: Commit Changes
      if: success()
      run: |-
        git config user.name actions-bot
        git config user.email actions@users.noreply.github.com
        git add -A
        git commit -m "[🚀 Spec Converter] Converted ${{ steps.example.outputs.count }} MD specs to PDF for Moodle" || exit 0
        git push
```