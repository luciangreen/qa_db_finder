# qa_db_finder
Question Answering Database-Style Algorithm Finder

Question Answering Database-Style Algorithm Finder is a SWI-Prolog algorithm that finds database style list-based algorithms with question answering, for example:

```
e.g. for cultural translation tool, the input lists of tuples: orig-trans, trans-bt where orig-bt have same meaning and input orig and output translation:
	a(OT,TB,BO,O,T):-
	member(A1,OT),A1=[O,T],
	member(A2,TB),A2=[T,B],
	member(A3,BO),A3=[B,O].
	
	which is run as:
	?- a([[a,b]],[[b,a]],[[a,a]],a,T).
	T = b.
```

# Getting Started

Please read the following instructions on how to install the project on your computer for writing algorithms.

# Prerequisites

* Use a search engine to find the Homebrew (or other) Terminal install command for your platform and install it, and search for the Terminal command to install swipl using Homebrew and install it or download and install SWI-Prolog for your machine at <a href="https://www.swi-prolog.org/build/">SWI-Prolog</a>.

# Mac, Linux and Windows (with Linux commands installed): Prepare to run swipl

* In Terminal settings (Mac), make Bash the default shell:

```
/bin/bash
```

* In Terminal, edit the text file `~/.bashrc` using the text editor Nano:

```
nano ~/.bashrc
```

* Add the following to the file `~/.bashrc`:

```
export PATH="$PATH:/opt/homebrew/bin/"
```

* Link to swipl in Terminal:

```
sudo ln -s /opt/homebrew/bin/swipl /usr/local/bin/swipl
```

# 1. Install manually

Download <a href="http://github.com/luciangreen/qa_db_finder/">this repository</a>.

# 2. Or Install from List Prolog Package Manager (LPPM)

* Download the <a href="https://github.com/luciangreen/List-Prolog-Package-Manager">LPPM Repository</a>:

```
mkdir GitHub
cd GitHub/
git clone https://github.com/luciangreen/List-Prolog-Package-Manager.git
cd List-Prolog-Package-Manager
swipl
['lppm'].
lppm_install("luciangreen","qa_db_finder").
../
halt.
```

# Running

* In Shell:
`cd qa_db_finder`
`swipl`
`['qa_db_finder.pl'].`
`qa_db_finder(Algorithm).`

# Authors

Lucian Green - Initial programmer - <a href="https://www.lucianacademy.com/">Lucian Academy</a>

# License

I licensed this project under the BSD3 License - see the LICENSE.md file for details
