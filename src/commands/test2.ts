import {Command, flags} from '@oclif/command'

export default class Test2 extends Command {
  static description = 'Display basic message'

  static examples = [
    `$ tarballcli test2`,
  ]

  static flags = {
    help: flags.help({char: 'h'}),
    // flag with a value (-n, --name=VALUE)
    name: flags.string({char: 'n', description: 'name to print'}),
    // flag with no value (-f, --force)
    force: flags.boolean({char: 'f'}),
  }

  static args = [{name: 'file'}]

  async run() {
    this.log(`Test2 command called`)
  }
}