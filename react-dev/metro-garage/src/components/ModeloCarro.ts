export interface Carro {
    id: number;
    modelname: string;
    model: string;
    cor: {
        r: number;
        g: number;
        b: number;
    };
    tuning: {
        motor: number;
        freio: number;
        suspensao: number;
        aro: number;
    };
    onGarage: string;
    placa: string;
}