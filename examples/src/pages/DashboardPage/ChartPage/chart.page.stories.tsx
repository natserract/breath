import { render } from '@redwoodjs/testing/web'

import ChartPage from './chart.page'

describe('ChartPage', () => {
  it('renders successfully', () => {
    expect(() => {
      render(<ChartPage />)
    }).not.toThrow()
  })
})
