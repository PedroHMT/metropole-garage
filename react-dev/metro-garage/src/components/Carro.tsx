import React from 'react'
import { Carro as ModelCarro } from './ModeloCarro'

interface C{
    carro: ModelCarro;
    spawnC: (carro: ModelCarro) => void;
}

const Carro: React.FC<C> = ({carro, spawnC}) => {

  var checkGarage = true;
  if(carro.onGarage === "True"){
    checkGarage = true;
  }else{
    checkGarage = false;
  }

  return (
    <div className='p-1'>
      <div className='grid rounded-lg p-3 max-w-lg grid-cols-2 bg-gray-900'>
        <div>
          <img src={`imgcars/${carro.model}.webp`}/>
        </div>
        <div className='grid gri-rows-3'>
          <div>
            <h1 className='text-4xl font-bold text-white uppercase'>{carro.model}</h1>
          </div>
          <div>
            {checkGarage ? <p className='text-sm font-bold text-green-500 uppercase'>Na Garagem</p>
              : <p className='text-sm font-bold text-red-300 uppercase'>Fora da Garagem</p>
            }
          </div>
          <div className='p-2'>
            {checkGarage ? 
              <button onClick={() => spawnC(carro)} className='motion-safe:transition p-3 text-sm font-medium text-center text-black bg-metrocolor rounded-lg hover:bg-lime-800'>Retirar Veículo</button>
              :
              <span></span>
            }
          </div>
        </div>
      </div>
    </div>
  )
}

export default Carro