# MCollective Discovery Plugin for Puppet Dashboard

MCollective Discovery Plugin to discover nodes in a Puppet Dashboard group/class.
group: all nodes in this Puppet Dashboard group.
class: all nodes in this Puppet Dashboard class (not the class used in a group).

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
--do (groupname)

Speficy the Puppet Dashboard class with
--wc (classname)
-C (classname)

## Examples

### Finding nodes from a Puppet Dashboard group

    $ mco find --dm dashboard --do <Puppet Dashboard group>

### Finding nodes from a Puppet Dashboard class

    $ mco find --dm dashboard --wc <Puppet Dashboard class>

### Finding nodes from a Puppet Dashboard group and class

    $ mco find --dm dashboard --do <Puppet Dashboard group> --wc <Puppet Dashboard class>

### Perform Puppet run from a Puppet Dashboard group

    $ mco puppet runonce --dm dashboard --do <Puppet Dashboard group>

### Perform Puppet run from a Puppet Dashboard class

    $ mco puppet runonce --dm dashboard --wc <Puppet Dashboard class>

### Perform Puppet run from a Puppet Dashboard group and class

    $ mco puppet runonce --dm dashboard --do <Puppet Dashboard group> --wc <Puppet Dashboard class>

