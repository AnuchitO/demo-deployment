'use client'

import {useEffect, useState} from 'react'

export default function BackendStatus() {
  const [status, setStatus] = useState('')
  const [err, setError] = useState<string | null>(null)

  const url = `${process.env.NEXT_PUBLIC_BACKEND_URL}/api/v1/health`

  useEffect(() => {
    fetch(url)
      .then((res) => {
        if (!res.ok) {
          throw new Error(`HTTP status ${res.status}`)
        }
        return res.json()
      })
      .then((data) => {
        setStatus(data)
      })
      .catch((err) => {
        setError(err.toString())
      })
  }, [url])

  return (
    <div>
      <h1>Backend Status</h1>
      <p>status: {status}</p>
      <p>error api: {JSON.stringify(err)}</p>
    </div>
  )
}
