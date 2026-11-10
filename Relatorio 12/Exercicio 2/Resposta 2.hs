pesoMaximo :: Double
pesoMaximo = 10.0

-- Ao tentar definir pesoMaximo novamente, o código dá erro de variavel duplicada
-- pesoMaximo = 15.0

data Encomenda = Encomenda {destinatario :: String, peso :: Double, frete :: Double} deriving (Show)

descrever :: Encomenda -> String
descrever e = "Destinatario: " ++ destinatario e ++ " | Peso: " ++ show (peso e) ++ " kg | Frete: R$ " ++ show (frete e)

cabemNaVassoura :: [Encomenda] -> [Encomenda]
cabemNaVassoura = filter (\e -> peso e <= pesoMaximo)

totalDeFretes :: [Encomenda] -> Double
totalDeFretes encomendas = sum (map frete encomendas)

main :: IO ()
main = do
    let encomendas = [
            Encomenda { destinatario = "Hotel Central", peso = 15.5, frete = 50.50 }, 
            Encomenda { destinatario = "Padaria Osono", peso = 3.5, frete = 18.20 }, 
            Encomenda { destinatario = "Senhora dos Bolos", peso = 25.0, frete = 44.22 }, 
            Encomenda { destinatario = "Menina do Vestido Vermelho", peso = 4.35, frete = 25.2 }, 
            Encomenda { destinatario = "Tombo", peso = 1.2, frete = 10.99 }]

    putStrLn "=== Todas as encomendas ==="
    mapM_ putStrLn (map descrever encomendas)

    let entregaveis = cabemNaVassoura encomendas

    putStrLn "\n=== Encomendas que cabem na vassoura ==="
    mapM_ putStrLn (map descrever entregaveis)

    putStrLn "\n=== Total de fretes das encomendas que cabem ==="
    putStrLn ("Total: R$ " ++ show (totalDeFretes entregaveis))
