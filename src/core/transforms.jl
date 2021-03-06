

# transform successes (Empty and Value)
# function must return a Value instance

@auto_hash_equals type Transform<:Delegate
    name::Symbol
    matcher::Matcher
    f::Function
    Transform(matcher, f) = new(:Transform, matcher, f)
end

@auto_hash_equals immutable TransformState<:DelegateState
    state::State
end

always_print(::Transform) = false

# execute and failure come from Delegate

success(k::Config, m::Transform, s, t, i, r::Value) = Success(TransformState(t), i, m.f(r))



# simplified version for transforming Success (remove and re-add the Success
# wrapper).

Appl(m::Matcher, f::Applicable) = Transform(m, x -> Any[f(x)])

function App(m::Matcher, f::Applicable)
    if f == vcat
        Transform(m, x -> Any[x])
    else
        Transform(m, x -> Any[f(x...)])
    end
end
