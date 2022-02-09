"""
This module contains [`Behaviour`](@ref)s, as well as a specific type of
[`Behaviour`](@ref) -- [`NamedBehaviour`](@ref).
"""
module Behaviours

using UUIDs

export Behaviour
export NamedBehaviour
export uuid
export name

"""
An abstract behaviour. This **must** provide a `uuid`` method.
"""
abstract type AbstractBehaviour end

"""
A Behaviour which could be performed.

# Fields

- `uuid::`[`UUID`](@ref) -- The UUID of the [`Behaviour`](@ref).
"""
struct Behaviour <: AbstractBehaviour
    uuid::UUID
end

"""
    Behaviour()::Behaviour

Create a new [`Behaviour`](@ref) using a newly generated [`UUID`](@ref).
"""
Behaviour() = Behaviour(UUIDs.uuid4())

"""
    uuid(b::Behaviour)::UUID

Gets the [`UUID`](@ref) of a [`Behaviour`](@ref).
"""
uuid(b::Behaviour)::UUID = b.uuid

"""
A Behaviour with a name.

# Fields

- `behaviour::`[`Behaviour`](@ref) -- The [`Behaviour`](@ref) to be named.
- `name::String` -- The name of the [`NamedBehaviour`](@ref).
"""
struct NamedBehaviour <: AbstractBehaviour
    behaviour::Behaviour
    name::String
end

"""
    NamedBehaviour(name::String)::NamedBehaviour

Creates a new [`NamedBehaviour`](@ref), with a specified `name` and randomly
generated [`UUID`](@ref), as implemented in the constructor
[`Behaviour()`](@ref).
"""
NamedBehaviour(name::String) = NamedBehaviour(Behaviour(), name)

"""
    uuid(b::NamedBehaviour)::UUID

Gets the [`UUID`](@ref) of a [`NamedBehaviour`](@ref).
"""
uuid(b::NamedBehaviour)::UUID = b.behaviour.uuid

"""
    name(b::NamedBehaviour)::String

Gets the name of a [`NamedBehaviour`](@ref).
"""
name(b::NamedBehaviour)::String = b.name

end # module
