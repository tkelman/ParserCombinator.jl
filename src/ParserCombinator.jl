
module ParserCombinator

using DataStructures.Stack
using Compat
import Base: start, endof, getindex

export Cache, NoCache, make_all, make_one, parse_one, parse_all,
ParserException, Value, Empty, EMPTY,
Epsilon, Insert, Dot, Fail, Drop, Equal, Repeat, ALL, Star, Plus, Seq, And, 
Alt, Lookahead, Not, Pattern, Delayed, Debug, Eos,
TransformResult, TransformSuccess, TransformValue,
@p_str, @P_str, @s_str, @S_str, Opt,
Parse, PUInt, PUInt8, PUInt16, PUInt32, PUInt64, 
PInt, PInt8, PInt16, PInt32, PInt64, PFloat32, PFloat64,
Word, Space

include("types.jl")
include("matchers.jl")
include("parsers.jl")
include("transforms.jl")
include("sugar.jl")
include("extras.jl")

end