import { render } from '@redwoodjs/testing/web'

import {{NAME}} from './{{SUB_NAME}}'

describe('{{NAME}}', () => {
  it('renders successfully', () => {
    expect(() => {
      render(<{{NAME}} />)
    }).not.toThrow()
  })
})
