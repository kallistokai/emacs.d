Quick Installation

First, install the required Python packages::

# Either of these
pip install rope
pip install jedi
# flake8 for code checks
pip install flake8
# and autopep8 for automatic PEP8 formatting
pip install autopep8
# and yapf for code formatting
pip install yapf

One-line install: pip install jedi flake8 autopep8

Evaluate this in your *scratch* buffer:

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))

Then run M-x package-refresh-contents to load the contents of the new repository, and M-x package-install RET elpy RET to install elpy.

Finally, add the following to your .emacs:

(package-initialize)
(elpy-enable)

Done.
