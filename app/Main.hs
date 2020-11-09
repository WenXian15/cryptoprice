module Main (main) where

import CryptoCompare
import System.Environment

main :: IO ()
main = do
  putStrLn("1. Fetch Coin List")
  putStrLn("2. Coin Price")
  putStrLn("3. Fetch Daily Price History") 
  putStrLn("4. Fetch Coin Snapshot")
  choice <- getLine
  case read (choice) of 
    1 -> fetchC
    2 -> priceR
    3 -> printHR
    4 -> snapshotR
    otherwise -> putStrLn ("Invalid Number")

fetchC :: IO()
fetchC = do
  coinList <- fetchCoinList
  either print (print . length) coinList
  either print (print . head) coinList

priceR :: IO()
priceR = do
  priceResp <- fetchCurrentPrice "ETH" ["BTC", "EUR", "BTC"]
  print priceResp

printHR :: IO()
printHR = do
  priceHistResp <- fetchDailyPriceHistory "BTC" "USD" 300
  print priceHistResp

snapshotR :: IO()
snapshotR = do
  snapshotResp <- fetchCoinSnapshot "BTC" "USD"
  print snapshotResp