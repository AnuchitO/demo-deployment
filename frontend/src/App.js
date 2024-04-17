import './App.css'
import BackendStatus from './BackendStatus'

function App() {
  const hostname = window.location.hostname

  return (
    <div className="App">
      <header className="App-header">
        <h1>app host ${hostname}</h1>
        <BackendStatus />
      </header>
    </div>
  )
}

export default App
