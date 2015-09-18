# Listings Search API

This rails project implements a single API endpoint which gives the user the
ability to send a GET request to the /listings url with or without queries that
relate to columns in the listings table. Output is formatted as GeoJSON using
a jbuilder template.

## General Approach

I decided to use a class method on Listing to go through the given queries and
chain where conditions that are determined based on the presence of substrings
"max" and "min" as well as the actual column names. The purpose of chaining where
queries was to avoid an N+1 query, which in a case with 10,000 rows, would be
extremely slow. As I designed it, the api ignores specifications that do not
refer to actual columns or are not min/maxable.
