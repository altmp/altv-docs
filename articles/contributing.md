# How to Contribute

This document includes a set of guidelines for contributing to alt:V documentation.

## Table of Contents

1. [Documentation structure](#documentation-structure)
1. [Linked repositories](#linked-repositories)
1. [Build tools](#build-tools)
1. [Initial setup](#initial-setup)
1. [Generating and testing](#generating-and-testing)
1. [Creating articles](#creating-articles)
1. [Publishing your work](#publishing-your-work)

## Documentation structure

Structure consists of one or more repositories linked to the core repository (you're currently in it).

Core repository is responsible for including linked repositories in documentation generation process. We're using DocFx generator for that task.

Each linked repository have directory structure that looks similar to this:
```
└───docs
    │   build.cmd
    │   build.ps1
    │   docfx.json
    │   index.md
    │   toc.yml
    │
    ├───api
    └───articles
```

`docfx.json` is the main configuration file, used locally for testing purposes. If you wish to learn more about its format, refer to [this](https://dotnet.github.io/docfx/tutorial/docfx.exe_user_manual.html#3-docfxjson-format).

`build.cmd` and `build.ps1` are scripts written in PowerShell to test documentation locally before publishing changes to core repository. Later we'll explain how they work and how to use them.

`index.md` and `toc.yml` are main Conceptual documents that are required (with some exceptions) in documentation.

`toc.yml` file (Table of Contents or ToC) is YAML document that specifies documentation structure in current directory and is responsible for linking other subdirectories for ease of navigation. If you wish to learn more about its format, refer to this [article](https://dotnet.github.io/docfx/tutorial/docfx.exe_user_manual.html#23-generate-documentation-command-docfx-build).

`index.md` file is Markdown document that appear in every directory and serves as a starting page.

`api` contains API documentation, which is mostly generated automatically from source code of the project and later incorporated by documentation generator. When generated automatically, we don't edit these files directly, but we use files called overwrite documents, which allows us to overwrite files without editing source at all.

`articles` contains Conceptual documentation, which will be the place where you'll spend the most of your time.
In the opposition to `api` folder, files there are created manually by contributors.

## Linked repositories

We include community created modules in our documentation and if you want to contribute to language specific documentation, switch to repository posted below:

| Language | Repository
| ---      | ---
| JS       | [https://github.com/altmp/altv-types]()
| C#       | [https://github.com/FabianTerhorst/coreclr-module]()
| Lua      | [https://github.com/drakeee/altv-lua-module]()

## Build tools

As mentioned previously, every linked repository should contain build tools to easily test and verify your work.

As of now, we're only providing ways to do that on Windows, where PowerShell is installed.

> [!WARNING]
> Other operating systems are not supported by us and by current documentation generator (although it might change in DocFx v3).

Actual code is defined in `build.ps1`, where `build.cmd` serves as wrapper (by default in Windows Explorer it's not allowed to execute PowerShell scripts by simply opening them).

Command-line arguments:

| Argument        | Description                                       | Usage
| ---             | ---                                               | ---
| `port `         | Changes port used by DocFx to host website on.    | `./build.ps1 -port 80`
| `cleanMetadata` | All generated output will be removed on each run. | `./build.ps1 -cleanMetadata`
| `cleanOnly`     | All dependencies will be removed only.            | `./build.ps1 -cleanOnly`

## Initial setup

To start adventure with contribution, you need programs installed such as Git, Node with npm package manager and if you wish to work with C# documentation, Visual Studio with ".NET desktop development" workload or Visual Studio Build Tools with ".NET Desktop build tools" workload.

1. Fork the repository - https://github.com/altmp/altv-docs/fork
1. Open a terminal on Windows.
1. Move to the directory that you want to work in.
1. Clone your repository, replace USER with your GitHub username:
    ```bash
    git clone https://github.com/USER/altv-docs
    ```
1. Add the altmp/altv-docs repo as a remote repository
    ```bash
    git remote add upstream https://github.com/altmp/altv-docs
    ```
1. Switch to the `docs` directory if there's one in your forked repository. It should have files as described in documentation structure.

## Generating and testing

When `build.ps1` script is executed, first we download dependencies such as DocFx tool, plugins, templates or linked repositories etc.

> [!WARNING]
> Keep in mind that currently we don't automatically update dependencies, but manually deleting them should trigger redownload.

Next thing is project metadata generation, which is needed for API documentation.

Lastly, DocFx build is executed and generated site will be available on `localhost:8080` by default.

To stop running script or update website with newest changes, simply terminate running script by pressing key combination `Ctrl+C`. After that, you can execute script again if needed.

If everything works to this moment, you can now start contributing.

> [!TIP]
> It's highly recommended that you should work on separate branch rather than `master`, so you can easily incorporate changes when repository gets updated.

## Creating articles

Before you start creating/editing files, you should think about what you want to add first.

> [!WARNING]
> You can't write articles about GTA:V stuff, like modding, data etc. That stuff belongs to our wiki website.

Title should be as short as possible, understandable and preferably catchy.

Another thing to do is to choose proper category for your article. You should find available ones in ``articles/`` directory, they look like folders.

Now, if you plan on making only single article, you can go to step [Single article](#single-article).
If not, you've to create category for them in case you haven't found one. Follow instructions defined in step [Article series](#article-series).

### Article series

Just like before, you've to think of the name for your category and it also should be as short as possible, understandable and preferably catchy (also it can't be the same as article name).

When you got one, create new folder with that name in ``articles/`` directory.

> [!TIP]
> Remember, name should be lowercase, alphanumeric and spaces should be replaced with hyphen.

You can go inside that folder and create two files there named ``index.md`` and ``toc.yml``.
These files are required, though ``index.md`` can stay empty for now.

Before we'll focus on making actual articles, we've to make your category visible in Table of Contents.

Let's open ``articles/toc.yml`` file, which now looks similar to this:
```yaml
- name: Getting Started
  href: getting-started/
  topicHref: getting-started/index.md
- name: How to Contribute
  href: contributing.md

```

We'll copy ``Getting Started`` item and append it just below with changed details.

> [!CAUTION]
> Make sure that ``How to Contribute`` item is always at the bottom.

> Before:
> ```yaml
> - name: Getting Started
>   href: getting-started/
>   topicHref: getting-started/index.md
> - name: How to Contribute
>   href: contributing.md
> 
> ```
> After:
> ```yaml
> - name: Getting Started
>   href: getting-started/
>   topicHref: getting-started/index.md
> - name: Fancy Category
>   href: fancy-category/
>   topicHref: fancy-category/index.md
> - name: How to Contribute
>   href: contributing.md
> 
> ```

If you've done everything correctly to this point, your category should now be visible.

Let's go back to our ``index.md`` file created earlier.

Index file in our category should contain short summary and
what articles are featured.

Now we can move on to [next step](#single-article) below.

### Single article

Now you can create file in ``articles/`` directory (or in your category directory) with title as filename and `.md` extension.

> [!TIP]
> Remember, filename should be lowercase, alphanumeric and spaces should be replaced with hyphen.

Now that file will be included in generation process, but it's not visible in Table of Contents (also abbreviated as ToC) yet.

To happen so, we need to add new entry in `toc.yml` file in the same directory, so your file will be fully visible.

> Before:
> ```yaml
> - name: Getting Started
>   href: getting-started/
>   topicHref: getting-started/index.md
> - name: How to Contribute
>   href: contributing.md
> 
> ```
> After:
> ```yaml
> - name: Getting Started
>   href: getting-started/
>   topicHref: getting-started/index.md
> - name: Fancy Article
>   href: fancy-article.md
> - name: How to Contribute
>   href: contributing.md
> 
> ```

In case you're creating __article series__, your ``toc.yml`` file is more likely empty at the moment.
You don't need to copy code above, you'll only need to add new item.

Now we can switch to our file content and first text which will be title formatted as ``Heading 1``.

> Example:
> ```md
> # Contribution
> 
> ... content here ...
> 
> ```

If you encounter trouble with Markdown, you can refresh your memory [here](https://www.markdownguide.org/basic-syntax).

## Publishing your work

Once you have finished working on your changes, you can submit a pull request to have your changes merged into the repository and included in the documentation.

Before submitting a pull request, make sure that you've verified your work.

If you've doubts or need help with something, feel free to ask in alt:V Discord server [#scripting-offtopic](https://discord.com/channels/371265202378899476/576771706119520287).
