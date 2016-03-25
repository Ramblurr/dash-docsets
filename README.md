# Dash Docsets

A few custom dash docsets.

At some point I should clean these up and contribute them back to [the user contributions repo](https://github.com/Kapeli/Dash-User-Contributions)

## Docsets

Currently this repo has docsets for:

* [QUnit](https://api.qunitjs.com/)
* [yuidoc](https://yui.github.io/yuidoc/syntax/index.html)

## Setup

* `src-docs`: the html source files for the various projects
* `src`: icons, and dashing configuration to create the docset
* `docsets`: the latest built versions of the docsets

You must have these tools installed:

* [Dashing](https://github.com/technosophos/dashing) (must install from git)
* [httrack](http://www.httrack.com) (just a `brew` or `dnf/apt-get` install away)

### 1 Fetch the documentation

Most of the projects use `httrack` to mirror the api documentation offline.
```bash
cd src-docs/$PROJECT
make
# repeat
```

### 2 Build the docsets

```bash
cd src/$PROJECT
make build       # builds the docst to ./src/$PROJECT/$PROJECT.docset, you can test it from here
make publish     # moves and replaces docsets/$PROJECT.docset
```




