use 5.014;
use warnings;

package PDF::Document 0.01;

use Carp 'croak';
use Scalar::Util 'blessed';

=head1 NAME

PDF::Document - A universal PDF library for creating, reading and updating PDF documents.

=head1 VERSION

Version 0.01

=head1 SYNOPSIS

  use PDF::Document;
  
  # Create a blank PDF::Document
  $pdf = PDF::Document->new;
  
  # Load a PDF::Document from a file
  $pdf = PDF::Document->load('my.pdf');
  
  # Save the PDF::Document to a file
  $pdf->save('new.pdf');

=head1 METHODS

=head2 new

Returns a new PDF object.

=cut

sub new {
    my($class) = @_;

    my %self = (
        version => 1.0,
        _ => [
            { Type => 'Catalog' }, # Catalog dictionary
            { Type => 'Pages', Kids => [], Count => 0 }, # Page tree
        ],
        pages => [],
        @_
    );
    $self{_}[0]{Pages} = $self{_}[1];

    bless \%self, $class;
}

=head2 load($filename)

  $pdf = PDF::Document->load('my.pdf')
      or die "Can't open my.pdf: $PDF::Document::error!\n";

Read and parse the file into a new C<PDF::Document> object.
Returns the C<PDF::Document> on success, or dies on failure.

=cut

sub load {
    my($class, $file) = @_;

    my $self = $class->new;
    open my $fh, '<:raw', $file or croak $!;

    close $fh;

    ...;
}

=head2 save($filename)

  $pdf->save('my.pdf')
      or die "Can't save my.pdf: $PDF::Document::error!\n";

Write the C<PDF::Document> object to a file.
This will replace the file if it exists.
Returns the C<PDF::Document> on success, or dies on failure.

=cut

sub save {
    my($self, $file) = @_;

    ...;
}

=head2 add_page($position, $page)

  $new_blank_last_page = $pdf->add_page;
  $new_blank_first_page = $pdf->add_page(1);
  $pdf->add_page(0, $my_page);

Add a page to the PDF::Document.
This can be a blank new page or you can provide a PDF::Document::Page to be copied.
It will be added as the last page by default, or if the $position is given it will be inserted at that position.
Page numbers start from 1.
If the $position is negative it will be inserted that many pages before the last page.

=cut

sub add_page {
    my($self, $idx, $page) = @_;

    if (defined $page) {
        blessed $page and $page->isa('PDF::Document::Page')
            or croak 'Error: page is not a PDF::Document::Page';

        ...;
    } else {
        ...;
    }

    ...;
}

1;

__END__

=head1 AUTHOR

Vernon Lyon, C<< <vlyon at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-pdf-document at rt.cpan.org>, or through the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=PDF-Document>.  I will be notified, and then you'll automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

  perldoc PDF::Document


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=PDF-Document>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/PDF-Document>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/PDF-Document>

=item * Search CPAN

L<http://search.cpan.org/dist/PDF-Document/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2014 Vernon Lyon.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut
