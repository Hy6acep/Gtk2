#!/usr/bin/perl -w
use strict;
use Gtk2::TestHelper tests => 9;

# $Header: /cvsroot/gtk2-perl/gtk2-perl-xs/Gtk2/t/GtkEditable.t,v 1.1 2004/02/06 21:34:08 kaffeetisch Exp $

my $adjustment = Gtk2::Adjustment -> new(0, 0, 100, 1, 5, 10);
my $spin = Gtk2::SpinButton -> new($adjustment, 0.2, 1);
isa_ok($spin, "Gtk2::Editable");

my $entry = Gtk2::Entry -> new();
isa_ok($entry, "Gtk2::Editable");

$entry -> set_text("Bla");

$entry -> select_region(1, 3);
is_deeply([$entry -> get_selection_bounds()], [1, 3]);

is($entry -> insert_text(" Blub", 3), 8);
is($entry -> get_chars(0, 8), "Bla Blub");
$entry -> delete_text(3, 8);

is($entry -> insert_text(" Blub", 5, 3), 8);
is($entry -> get_chars(0, 8), "Bla Blub");
$entry -> delete_text(3, 8);

$entry -> set_position(2);
is($entry -> get_position(), 2);

$entry -> set_editable(1);
is($entry -> get_editable(), 1);

my $window = Gtk2::Window -> new();
$window -> add($entry);

$entry -> cut_clipboard();
$entry -> copy_clipboard();
$entry -> paste_clipboard();
$entry -> delete_selection();

__END__

Copyright (C) 2003 by the gtk2-perl team (see the file AUTHORS for the
full list).  See LICENSE for more information.