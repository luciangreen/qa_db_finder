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

None

# Installation from List Prolog Package Manager (LPPM)

* Optionally, you can install from LPPM by installing <a href="https://www.swi-prolog.org/build/">SWI-Prolog</a> for your machine, downloading the <a href="https://github.com/luciangreen/List-Prolog-Package-Manager">LPPM Repository</a>,
```
git clone https://github.com/luciangreen/List-Prolog-Package-Manager.git
cd List-Prolog-Package-Manager
swipl
```
loading LPPM with `['lppm'].` then installing the package by running `lppm_install("luciangreen","qa_db_finder").`.

# Installing

* Download the repository to your machine.
Enter the following to load the algorithm:
```
halt
cd ../qa_db_finder
swipl
['qa_db_finder.pl'].
qa_db_finder(Algorithm).
```

# Authors

Lucian Green - Initial programmer - <a href="https://www.lucianacademy.com/">Lucian Academy</a>

# License

I licensed this project under the BSD3 License - see the LICENSE.md file for details
