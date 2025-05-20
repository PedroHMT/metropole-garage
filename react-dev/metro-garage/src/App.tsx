import { useState, useEffect } from 'react'
import './App.css'
import Carro from './components/Carro';
import { Carro as ModelCarro} from './components/ModeloCarro';

function App() {
  const [carros, setCarros] = useState<ModelCarro[]>([]);
  const [focusNui, setFocusNui] = useState(false);

  useEffect(() => {
    const state = (event) => {
      if(event.data.action === 'abrir'){
        setFocusNui(true);
      }else if(event.data.action === 'fechar'){
        setFocusNui(false);
      }
      if(event.data.action === 'dadosCarrosP'){
        setCarros(event.data.carros)
      }
    }

    window.addEventListener('message', state);

    return () => {
      window.removeEventListener('message', state);
    };
  }, []);

  if(!focusNui) return null;

  function spawnC(carro: ModelCarro){
    fetch("https://metro-garage/spawnCar", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        id: carro.id,
        model: carro.model,
        cor: carro.cor,
        tuning: carro.tuning,
        placa: carro.placa
      })
    }).then(() => {
        setFocusNui(false);
      })
  }

  return (
    <>
    <div className="fixed inset-0 flex flex-col justify-start items-start h-screen bg-black/30 z-50">
        <div className="bg-transparent opacity-100 flex-1 overflow-y-auto w-[500px] no-scrollbar">
          {carros.map((carro) => (
            <Carro key={carro.id} carro={carro} spawnC={spawnC} />
          ))}
        </div>
        <div className='w-[500px] mb-5 mt-1'>
            <button onClick={() => {
              fetch('https://metro-garage/fechar', {
                method: 'POST',
                headers: {
                  'Content-Type': 'application/json',
                },
                body: JSON.stringify({})
              }).then(() => {
                setFocusNui(false);
              })
            }} className='inline-flex items-center px-10 py-5 text-sm font-medium text-center text-white bg-red-900 rounded-lg'>Fechar Menu</button>
        </div>
      </div>
    </>
  )
}

export default App