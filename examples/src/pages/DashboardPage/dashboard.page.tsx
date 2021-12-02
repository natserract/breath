import { MetaTags } from '@redwoodjs/web'
import useStyles from './dashboard.page.styles'

const DashboardPage = () => {
  const classes = useStyles()

  return (
    <>
      <MetaTags
        title="Test"
        // description="Test description"
        /* you should un-comment description and add a unique description, 155 characters or less
        You can look at this documentation for best practices : https://developers.google.com/search/docs/advanced/appearance/good-titles-snippets */
      />
      <h1>TestPage</h1>
      <p>
        Find me in <code>./web/src/pages/TestPage/TestPage.tsx</code>
      </p>
      <p>
        My default route is named <code>test</code>, link to me with `
      </p>
    </>
  )
}

export default DashboardPage
