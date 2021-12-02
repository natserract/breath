import { render } from '@redwoodjs/testing/web'

import MenuComponent from './menu.component'

describe('MenuComponent', () => {
  it('renders successfully', () => {
    expect(() => {
      render(<MenuComponent />)
    }).not.toThrow()
  })
})
