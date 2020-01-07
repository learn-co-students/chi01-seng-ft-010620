=begin

(In case you were wondering how to do multi-line comments in Ruby, btw...)

One pattern of effective apprenticeship is the "breakable toy."
It's code you don't NEED to be perfect,
or finished,
or error-free,
and therefore you get to PLAY AROUND with it.

It's usually a term applied to small apps, and the smallest app of all
might be one file that does one or two things.

Accordingly, I always keep a "toy.rb" file close at hand.
It helps me test stuff out that would be too tedious to type into IRB,
and it lets me hang on to whatever I'm testing out
without needing to keep a
REPL.it browser tab open.

=end

new_word = "cool"
$huh = "amazing"

def scope_test(word)
  # word = "scurrilous"
  p $huh
  p word
end

scope_test(new_word)
