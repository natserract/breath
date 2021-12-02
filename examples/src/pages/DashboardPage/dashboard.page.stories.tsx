import { render } from '@redwoodjs/testing/web'

import DashboardPage from './dashboard.page'

describe('DashboardPage', () => {
  it('renders successfully', () => {
    expect(() => {
      render(<DashboardPage />)
    }).not.toThrow()
  })
})
