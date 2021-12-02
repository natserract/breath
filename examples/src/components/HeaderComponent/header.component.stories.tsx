import { render } from '@redwoodjs/testing/web'

import HeaderComponent from './header.component'

describe('HeaderComponent', () => {
  it('renders successfully', () => {
    expect(() => {
      render(<HeaderComponent />)
    }).not.toThrow()
  })
})
