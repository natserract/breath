import useStyles from './{{SUB_NAME}}.styles'

const {{NAME}} = () => {
  const classes = useStyles()

  return (
    <div>
      <h2>{'{{NAME}}'}</h2>
      <p>{'Find me in ./web/src/components/{{NAME}}/{{SUB_NAME}}.tsx'}</p>
    </div>
  )
}

export default {{NAME}}
