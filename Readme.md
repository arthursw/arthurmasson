# Arthur Masson website

Install [Hugo](https://gohugo.io/getting-started/quick-start/)

Download the main theme [`minimo`](https://minimo.netlify.app/docs/installation/) by initializing and updating the submodule (the minino theme in `themes/minimo/`) : run `git submodule init` to initialize your local configuration file, and `git submodule update` to fetch all the data from that project and check out the appropriate commit listed in your superproject.

Both  `cvfr/` and `cv/` use the same theme [hugo-orbit-theme](https://github.com/aerohub/hugo-orbit-theme). You might have to clone it in `cv/themes/` and create a symlink in `cvfr/themes/` by going to `cvfr/` and running `ln -s ../cv/themes themes`.

Build the french and english versions of the resume by going to `cvfr/` and `cv/` respectively and by running `hugo` in each directory.

Copy the built resumes (the `cv/public/` and `cvfr/public/` folders) in `static/` under the name `amcv/` and `amcvfr/`:
- `cd static/`
- `trash amcv`
- `trash amcvfr`
- `cp -r ../cv/public amcv`
- `cp -r ../cvfr/public amcvfr`

Then, run `hugo` at the root of the project to build the website.


