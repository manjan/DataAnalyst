#!/usr/bin/env perl

%greetings = ('de' => 'Hallo', 
              'fr' => 'Bonjour', 
              'mx' => 'Hola');

while (<STDIN>) {
   ($name, $email) = split /\t/;
   ($suffix) = $email =~ /\.([a-z]+)$/;
   $greeting = $greetings{$suffix};
   $greeting = 'Hello' unless defined($greeting);
   print "$greeting $name\n";
}
