# Puppet module demo - cloudflared

This is an example [puppet](https://puppet.com/) module which installs and configures 
[cloudflared](https://developers.cloudflare.com/1.1.1.1/dns-over-https/cloudflared-proxy/).

The main goals are:

- An example puppet module written and managed using [pdk](https://github.com/puppetlabs/pdk)
- Demonstrate writing unit tests using [rspec-puppet](https://puppet.com/blog/unit-testing-rspec-puppet-for-beginners)
- Demonstrate acceptance testing using [beaker](https://github.com/puppetlabs/beaker)
[] Automated testing
[] Automated release management
[] Deploy to puppet forge
[] Others 

## Notes

This module has been developed using [pdk](https://github.com/puppetlabs/pdk).
Once you have insalled it, you can install the dependencies using:

```
$ pdk bundle install
```

You may need to install `rubygem-devel` and `zlib-devel` (or similary named packages).

### Validate your changes

Run `pdk validate` to run static analysis tests. 

### Unit tests

To run the unit tests:

```
$ pdk test unit
```


### Acceptance tests

To run the acceptances tests, you will need [vagrant](https://www.vagrantup.com/) 
and [VirtualBox](https://www.virtualbox.org/wiki/Downloads) installed and setup
correctly. Once that's done:

```
$ BEAKER_set=ubuntu-server-1604-x64 pdk bundle -- exec rake beaker
```

If you are adding an acceptance test and want to investigate a failure,
you can ask `beaker` to not destroy the SUT by:

```
$ BEAKER_destroy=no BEAKER_set=ubuntu-server-1604-x64 pdk bundle -- exec rake beaker
```

Once the test run has finished, you can go to the `.vagrant` directory and then use `vagrant ssh`
to SSH into the SUT.

### Resources

The following resources may be helpful:

- [Modern testing of modules](https://voxpupuli.org/blog/2014/04/22/modern-testing-of-modules/)
- [rspec-puppet](https://github.com/rodjek/rspec-puppet)
- [Beaker rspec doc](http://www.rubydoc.info/gems/beaker-rspec/6.0.0)
- [Rspec-retry doc](http://www.rubydoc.info/gems/rspec-retry/0.4.0)
- [rspec-puppet for beginners](https://puppet.com/blog/unit-testing-rspec-puppet-for-beginners)
