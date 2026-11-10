data Etapa = NaFila | NoBanho | Concluido deriving (Show, Eq)

data Atendimento = Atendimento { cliente :: String, servico :: String, valor :: Double, etapa :: Etapa } deriving (Show)

descrever :: Atendimento -> String
descrever a = cliente a ++ " - Servico: " ++ servico a ++ " | Etapa: " ++ show (etapa a) ++ " | Valor: R$ " ++ show (valor a)

concluir :: Atendimento -> Atendimento
concluir a = a { etapa = Concluido }

arrecadado :: [Atendimento] -> Double
arrecadado atendimentos =
    let concluidos = filter (\a -> etapa a == Concluido) atendimentos
    in sum (map valor concluidos)

main :: IO ()
main = do
    let atendimento1 = Atendimento { cliente = "Espirito do Rio", servico = "Banho de Ervas Medicinais", valor = 120.0, etapa = NaFila }
    let atendimento2 = Atendimento { cliente = "Sem Rosto (No-Face)", servico = "Banquete e Banho de Ouro", valor = 500.0, etapa = NoBanho }
    let atendimento3 = Atendimento { cliente = "Deus Radish (Oshira-sama)", servico = "Banho Aromatico Suave", valor = 85.0, etapa = NaFila }

    let listaOriginal = [atendimento1, atendimento2, atendimento3]

    let listaAtualizada = [concluir atendimento1, concluir atendimento2, atendimento3]

    putStrLn "=== Lista inicial de atendimentos ==="
    mapM_ putStrLn (map descrever listaOriginal)
    putStrLn ("Total arrecadado na lista inicial: R$ " ++ show (arrecadado listaOriginal))

    putStrLn "\n=== Lista atualizada ==="
    mapM_ putStrLn (map descrever listaAtualizada)
    putStrLn ("Total arrecadado na lista atualizada: R$ " ++ show (arrecadado listaAtualizada))

    putStrLn "\n=== Verificando a lista inicial novamente (Imutabilidade) ==="
    mapM_ putStrLn (map descrever listaOriginal)
    putStrLn ("Total arrecadado continua: R$ " ++ show (arrecadado listaOriginal))
