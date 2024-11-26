# Arthur Masson website

Install [Hugo](https://gohugo.io/getting-started/quick-start/)

Both  `cvfr/` and `cv/` use the same theme [hugo-orbit-theme](https://github.com/aerohub/hugo-orbit-theme). You might have to clone it in `cv/themes/` and create a symlink in `cvfr/themes/` by going to `cvfr/` and running `ln -s ../cv/themes themes`.

Build the french and english versions of the resume by going to `cvfr/` and `cv/` respectively and by running `hugo` in each directory.

Create the symlinks to the built resumes in `static/`:
- `cd static/`
- `ln -s ../cv/public amcv`
- `ln -s ../cvfr/public amcvfr`

Then, run `hugo` at the root of the project to build the website.


