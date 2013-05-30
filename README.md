# MCollective Discovery Plugin for Puppet Dashboard

MCollective Discovery Plugin to discover nodes in a Puppet Dashboard group.

To use this discovery plugin you need:
  * MCollective 2.2.1 at least
  * Puppet Dashboard 1.2.23 at least
  * Puppet Dashboard RAILS_ENV production

# TODO

  * better Puppet Dashboard detection
  * dynamic RAILS_ENV

## Discovery Plugin Installation

Place both files in the MCollective discovery directory and restart MCollective

## Usage

Speficy the dashboard discovery plugin with
--dm dashboard

Speficy the Puppet Dashboard group with
--do <groupname>

## Examples

### Finding nodes from a Puppet Dashboard group

    $ mco find --dm dashboard --do <Puppet Dashboard group>

### Perfom Puppet run

    $ mco puppet runonce --dm dashboard --do <Puppet Dashboard group>

