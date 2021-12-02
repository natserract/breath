import useStyles from './header.component.styles'

const HeaderComponent = () => {
  const classes = useStyles()

  return (
    <div>
      <h2>{'HeaderComponent'}</h2>
      <p>{'Find me in ./web/src/components/HeaderComponent/header.component.tsx'}</p>
    </div>
  )
}

export default HeaderComponent
