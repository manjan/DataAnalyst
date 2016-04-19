#!/usr/bin/env python

import sys

for line in sys.stdin:
   line = line.strip()
   (name, cents) = line.split("\t")

   # Failed attempt to format price in cents as dollars 
   formatted_price = format("$%.2f" % cents * 0.01)

   # Here's the fix: we must convert to an int first
   #formatted_price = format("$%.2f" % (int(cents) * 0.01))

  
   print "%s\t%s" % (name, formatted_price)
