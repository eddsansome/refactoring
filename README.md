# Refactoring

Hello and welcome to the Ruby version of Martin Fowler's `Refactoring` book

To get started:

1. fork the repo
2. clone your copy to your local machine
```
git clone git@github.com:<your_github_username>/refactoring.git
```
3. run `bundle install`
4. run `make all` to run specs for all of the chapters
5. run `make c{chapter number}` to run specs for a specific chapter

> Hint, if you haven't implemented the refactoring for a chapter, an error will be raised! Use this to locate where to begin on your journey

## Exercises

- look at code in the respective chapter dir e.g `lib/refactoring/chapters/chapter_1`
- the code in the `initial.rb` file is from the book
- the code in the `refactored.rb` file starts out life exactly the same as from the book (albeit in Ruby)
- it's your job to refactor the `Refactored` class, and ensure the spec for the chapter still passes!

## Exercise structure

lets take a look at an example exercise as an example `lib/refactoring/chapters/chapter_1/refactored.rb`

```ruby
Refactoring::Chapters::Chapter1::Refactored
```

When you open the file, you will be greeted by a class with a public static `::call` method, and some private static methods `::statement` and `::format`.

The output of the public `::call` method is what we will be testing in the specs.

Think of this as a wrapper method for your code. Please feel free to introduce extra classes, methods etc as you see fit

if the code is very complex you could even make a sub directory, just remember to execute your code within the `::call` method so we can check that no behaviour has changed from the initial implementation to the refactored version 🙌
