# Declare package 'Bob'
package Bob;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(hey);

sub hey {
  my ($msg) = @_;

  if(!$msg || $msg =~ m/^\s+$/){
    return 'Fine. Be that way!';
  }
  if($msg =~ m/[A-Za-z]/ && $msg eq uc($msg)){
    return "Whoa, chill out!";
  }
  return 'Whatever.';
}

1;
