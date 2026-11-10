data Esboco = Esboco { titulo :: String, tecnica :: String, horas :: Int } deriving (Show)

esbocoMaisRecente :: [Esboco] -> String
esbocoMaisRecente [] = "O caderno esta vazio."
esbocoMaisRecente (e:_) = "Mais recente: \"" ++ titulo e ++ "\" feita em " ++ tecnica e

contarEsbocos :: [Esboco] -> Int
contarEsbocos [] = 0
contarEsbocos (_:xs) = 1 + contarEsbocos xs

horasDesenhando :: [Esboco] -> Int
horasDesenhando [] = 0
horasDesenhando (e:xs) = horas e + horasDesenhando xs

main :: IO ()
main = do
    let caderno1 = [ 
            Esboco { titulo = "Ruinas do Norte", tecnica = "Nanquim", horas = 8 }, 
            Esboco { titulo = "Castelo das Montanhas", tecnica = "Carvao", horas = 23 }, 
            Esboco { titulo = "Elfos do Sul", tecnica = "Grafite", horas = 2 } ]

    putStrLn "=== Caderno original ==="
    putStrLn (esbocoMaisRecente caderno1)
    putStrLn ("Quantidade de esbocos: " ++ show (contarEsbocos caderno1))
    putStrLn ("Total de horas desenhando: " ++ show (horasDesenhando caderno1))

    putStrLn "\n=== Teste do caderno vazio ==="
    let cadernoVazio = [] :: [Esboco]
    putStrLn (esbocoMaisRecente cadernoVazio)

    -- Erro ao chamar o head em uma lista vazia
    -- putStrLn ("Titulo do primeiro no vazio: " ++ titulo (head cadernoVazio))

    let novoEsboco = Esboco { titulo = "Dragoes do Horizonte", tecnica = "Nanquim", horas = 20 }
    let caderno2 = novoEsboco : caderno1

    putStrLn "\n=== Comparacao apos adicionar novo esboco (Imutabilidade) ==="
    putStrLn "Caderno 1 (Original deve continuar inalterado)"
    putStrLn (esbocoMaisRecente caderno1)
    putStrLn ("Quantidade de esbocos: " ++ show (contarEsbocos caderno1))

    putStrLn "\nCaderno 2 (Novo caderno com o elemento na frente)"
    putStrLn (esbocoMaisRecente caderno2)
    putStrLn ("Quantidade de esbocos: " ++ show (contarEsbocos caderno2))
