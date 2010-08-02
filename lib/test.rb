#-- 
# hello.rb: provide proper boilerplate docs in all sourcefiles
# specifing the author, license, and possibly some quick info about the
# file. You can surround the boilplate comments with '--' and '++' like
# we've done here to make sure it doesn't get included in the generated
# documentation.
#
#
# Copyright (c) 2006 by Tim Becker (tim@kuriositaet.de) All rights
# Reserved.
#
# This is free software.  You may modify and redistribute this freely
# under your choice of the GNU General Public License or the Ruby
# License.
#
# See LICENSE for details
#
# BTW: The above does not constitute legal advice concerning how to
# handle code licensing issues.
#++


# Ruby Modules may be nested in order to provided namespaces.
module Well
# Each nested module can have it's own documenation.
module Tempered
# Lowest level of module nesting.
module Application

# Comments providing general descriptions of constructs like modules and
# classes should be provided where these are defined. The class Hello
# provides basically no functionality. It's only here to contain some
# demonstration code and in order for me to document it. 
class Hello
	# the constructor of the Hello class
	#
	def intialize name=nil
		@name=name
	end

	# the namesake of the Hello class. Provides the well loved
	# +helloworld+ functionality.
	def hello
		puts "Hello #{name?', ':''}#{@name}!"	
	end


end

# some function that does nothing. Located outside of the Hello class.
def some_function

end

end # module Application
end # module Tempered
end # module Well
