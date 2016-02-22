# GraphOptiTest
Test of fgl's optimization rules

This is a project created as a simple test case of the `RULES` pragma as used in
`fgl`'s module `Data.Graph.Inductive.PatriciaTree`. It was pushed to github primarily
to ask this question on StackOverflow: http://stackoverflow.com/questions/35557964/library-ghc-rules-dont-activate

To test this out, clone it and then:

    cabal sandbox init
    cabal install fgl --enable-library-profiling --enable-executable-profiling
    cabal configure --enable-library-profiling --enable-executable-profiling
    cabal build GraphOptiTest
    cabal run GraphOptiTest

Then look at the file `GraphOptiTest.prof` and see how much total time is spent
inside the `main1` routine versus the `main2` routine.

Then trace through the source of the `fgl` library, see that there are `RULES`
directives that clearly aren't being followed, and despair.
