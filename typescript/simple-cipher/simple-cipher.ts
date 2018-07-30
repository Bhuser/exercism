class SimpleCipher {

  key: string
  unicode_a: number = 97
  unicode_z: number = 123
  shift_max: number = 122
  array_max: number = 100
  alphabet_length: number = 26

  constructor(key?: string) {
    if (key !== undefined) {
      const regex = /^[a-z]+$/g
      if (!regex.test(key)) {
        throw 'Bad key'
      }

      this.key = key
    } else {
      this.key = [... Array(this.array_max)].map((_) => {
        return String.fromCharCode(Math.floor(Math.random() * this.alphabet_length) + this.unicode_a)
      }).join('')
    }
  }

    encode( input: string ) {
      return input.split('').map( (letter, index) => {
        const key = this.key[index % this.key.length]
        const letterCode = letter.charCodeAt(0)
        const keyCode = key.charCodeAt(0)

        let shift = keyCode + (letterCode - this.unicode_a)
        if ( shift > this.shift_max ) {
          shift = shift - this.unicode_z + this.unicode_a
        }
        return String.fromCharCode(shift)
      }).join('')
    }

    decode( input: string ) {
      return input.split('').map( (letter, index) => {
        const key = this.key[index % this.key.length]
        const letterCode = letter.charCodeAt(0)
        const keyCode = key.charCodeAt(0)

        let shift = this.unicode_a - (keyCode - letterCode)
        if ( shift < this.unicode_a ) {
          shift = this.unicode_z - (this.unicode_a - shift)
        }
        return String.fromCharCode(shift)
      }).join('')
    }
}

export default SimpleCipher
