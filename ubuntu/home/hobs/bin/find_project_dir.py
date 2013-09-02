#!/usr/bin/env python
# This hook is run after every virtualenv is activated.
import os.path
from os import environ
from sys import argv


def expand_path(*paths):
    """return os.path.abspath(os.path.realpath(os.path.expandvars(os.path.expanduser(os.path.join(*paths)))))

    These examples may only work on a POSIX-like system:
    >>> path = expand_path('$HOME')
    >>> 'home' in path or 'User' in path
    True
    >>> path.startswith('/')
    True
    >>> expand_path('~') == expand_path('$HOME')
    True
    >>> path = expand_path('~nonusernamesure/ly', '$SHELL')
    >>> path.endswith('sh')
    True
    >>> '~nonusernamesure/ly' in path
    True
     """
    return os.path.abspath(os.path.realpath(os.path.expandvars(os.path.expanduser(os.path.join(*paths)))))


def find_project_dir(project_name=None, project_homes=None, proj_subdirs=None, verbose=False):
    """Return the full, absolute path to a directory containing what looks like a source code project (git, svn, bzr repo or Django project)

    >>> find_project_dir(project_homes=['~/this_cant_possibly_exist/and/contain/a/project/$SHELL'], verbose=False)  # doctest: +ELLIPSIS
    >>> find_project_dir(project_homes=['~frank/ly/$SHELL'], verbose=False)
    >>> find_project_dir(project_homes=[''], verbose=True)
    """
    from sys import stderr

    if isinstance(project_homes, basestring):
        project_homes = [project_homes]

    workon_proj_file = environ.get('VIRTUALENVWRAPPER_PROJECT_FILENAME')  # typically '.project'
    workon_home = environ.get('WORKON_HOME')  # typically ~/.virtualenvs

    if project_name:
        proj_name = str(project_name)
    else:
        proj_name = os.path.basename(environ.get('VIRTUAL_ENV', ''))
    
    try:
        with open(expand_path(workon_home, proj_name, workon_proj_file), 'rUb') as fpin:
            found_path = fpin.read().strip('\n')
            return found_path
    except:
        found_path = None

    #environ['VENVWRAP_CURDIR_BEFORE_WORKON'] = os.path.abspath(os.path.curdir)

    proj_homes = (
        project_homes
        or environ.get('VENVWRAP_PROJECT_HOMES', '').split()
        or ['~/src', '~/flint-projects', '~/bin', '~/projects', '~/sublime-projects', '~'])

    proj_subdirs = (
        proj_subdirs
        or environ.get('VENVWRAP_PROJECT_HOMES_CONTAIN', '').split()
        or [os.path.join('django', '.git'), '.git', '.svn', '.bzr', 'readme.txt', 'README', 'README.md', 'CHANGELOG', 'VERSION'])

    while proj_homes:
        proj_home = proj_homes.pop()
        # take care of quoted paths from ENV variable
        proj_home = proj_home.strip("'").strip('"')
        proj_path = expand_path(proj_home, proj_name)
        if verbose:
            stderr.write('Checking to see if "%s" is a valid directory.\n' % proj_path)
        if not os.path.isdir(proj_path):
            continue
        for subdir in proj_subdirs:
            path = os.path.join(proj_path, subdir)
            if verbose:
                stderr.write('Looking for %s\n' % path)
            if os.path.exists(path):
                # remove the last directory from the path unless that would put you above the dir named for the project
                found_path_parent = os.path.split(path)[0]
                found_path = found_path_parent if len(found_path_parent) >= len(proj_path) else proj_path
                return found_path


def main(argv=None):
    """Print to stdout the project home path found with find_project_dir.find_project_dir(`project_homes`, `verbose`)
    """
    from sys import stdout, stderr

    # stderr.write(repr(argv) + '\n')
    project_homes = None  # ['~/src', '~/flint-projects', '~/bin', '~/projects', '~/sublime-projects', '~']
    proj_subdirs = None

    # TODO: Use getopt to process project_homes, verbose, and project_name keyword options/args
    verbose = False
    for verbosity in ('verbose', '-v'):
        if verbosity in argv:
            del(argv[argv.index(verbosity)])
            verbose = True
    if argv and len(argv) >= 2:
        project_name = argv[1]

    found_path = find_project_dir(project_name=project_name, project_homes=project_homes, proj_subdirs=proj_subdirs, verbose=verbose)
    # stderr.write(found_path + '\n')
    if found_path:
        stdout.write(found_path)
        # Don't attempt to os.chdir here, because subprocesses aren't allowed to affect the parent env
    else:
        stderr.write('Unable to find a valid virtualenvwrapper path in $VENVWRAP_PROJECT_HOMES=%s\n that contains the project name %s\n and also contains a subdir among $VIRTUALENVWRAPPER_PROJECT_HOMES_CONTAIN=%s.\n' % (repr(project_homes), repr(environ.get('VIRTUAL_ENV', '')), repr(proj_subdirs)))


if __name__ == "__main__":
    from sys import exit, argv
    main(argv=argv)
    exit(0)
