## MyStrCmp Programming Test ##

### Problem Description ###

Write a small console application that uses a string comparison function
(that you will also write) that meets the following prototype:

    int MyStrCmp(char \*a, char \*b) - for C;

or assume passed String data types - for C#

Entered or passed strings may be of any length, trap for edge conditions,
and display error messages. Functions cannot make use of, or "wrap" any
existing API calls (IE strlen(), strcmp(), ...). Function must return an int
that is &lt;0 if string1 is less than string2; 0 if string1 is the same as
string2; or &gt;0 if string1 is greater than string2; and display the 2 strings
as noted below.

If the return value is &lt;0, then one string is returned and is made up with
the two strings inverted and then concatenated, IE `abcdef` and `uvwxyz`, would
be displayed as `fedcbazyxwvu`.

If the return value is 0, then one string is returned and is made up with
the merged 2 input strings; IE `abcdef` and `abcdef`, would be displayed as
`aabbccddeeff`.

If the return value is &gt;0, then one string is returned and is made up with
the input strings inverted and merged; IE `uvwxyz` and `abcdef`, would be
displayed as `zfyexdwcvbua`


vim: filetype=markdown tabstop=2
