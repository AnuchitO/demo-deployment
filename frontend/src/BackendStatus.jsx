import React from 'react'
import {useEffect, useState} from 'react'
const {REACT_APP_BACKEND_URL} = process.env

export default function BackendStatus() {
  const [status, setStatus] = useState([])
  const [err, setError] = useState(null)

  const url = `${REACT_APP_BACKEND_URL}/api/v1/health`

  useEffect(() => {
    fetch(url)
      .then((res) => {
        if (!res.ok) {
          throw new Error(`HTTP status ${res.status}`)
        }
        return res.text()
      })
      .then((data) => {
        setStatus(data.split('\n'))
      })
      .catch((err) => {
        setError(err.toString())
      })
  }, [url])

  return (
    <div>
      <h1>Backend Status</h1>

      <p>status:</p>
      {status.map((line, index) => (
        <p key={index}>{line}</p>
      ))}
      <p>error api: {JSON.stringify(err)}</p>
    </div>
  )
}
