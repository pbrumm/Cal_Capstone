require_relative 'lib/year'
require_relative 'lib/month'


#need code to say if there's only 1 arg (argv0 is nil, that it's a year; w/ 2, see below; with

if ARGV.length > 2
  raise ArgumentError, 'Too many arguments'
elsif ARGV.empty?
  raise ArgumentError, 'No arguments given'
elsif ARGV.length == 2
  month = ARGV[0].to_i
  year = ARGV[1].to_i
elsif ARGV.length == 1
  year = ARGV[0].to_i
end

if month < 1 or month > 12 && year < 1800 or year > 3000
  raise ArgumentError, 'Not a valid month (1..12) and year range (1800..3000)'
elsif month < 1 or month > 12
  raise ArgumentError, 'Not a valid month number (1..12)'
elsif year < 1800 or year > 3000
  raise ArgumentError, 'Year out of range (1800..3000)'
end

if ARGV.length == 2
  new_month = Month.new(month, year)
  month_array = new_month.week_arrays(false)
  print month_array
elsif ARGV.length == 1
  new_year = Year.new(year)
  header = new_year.year_head.center(64)
  year_array = new_year.year_formatted_array
  print year_output = header + year_array
else
  raise ArgumentError, "Houston, we have a problem"
end

# puts `cal #{month} #{year}`